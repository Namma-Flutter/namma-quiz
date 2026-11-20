---
name: img2threejs
description: Procedural code-only image-to-3D Three.js reconstruction pipeline. Use when converting 2D reference images, concept art, or mockups into modular, animation-ready Three.js TypeScript models without external binary asset downloads.
---

# img2threejs: Procedural 3D Reconstruction Pipeline

Adapted from `img2threejs/img2threejs`. This skill guides the agent in reconstructing 3D assets from reference imagery using pure procedural Three.js and TypeScript.

---

## 1. Philosophy: Reconstruction-by-Code

Unlike traditional image-to-3D pipelines that rely on photogrammetry, heavy external GLB/OBJ binary downloads, or cloud APIs, `img2threejs` generates **code-only 3D models**:
* **Pure TypeScript**: Compiles to standard Three.js primitives, custom buffer geometries, and procedural materials.
* **Zero External Binary Assets**: No broken CDN asset links, giant 50MB files, or missing texture maps. Everything is rendered via code.
* **Fully Diffable & Animatable**: Hierarchical `THREE.Group` structure with explicit pivot points, joint rotations, and userData animation hooks.

---

## 2. The 8-Stage Sculpting Pipeline

When transforming an image into a procedural 3D model, execute through these 8 stages systematically:

```text
1. Blockout ──> 2. Structural ──> 3. Form ──> 4. Material
     │
     └──> 5. Surface ──> 6. Lighting ──> 7. Interaction ──> 8. Optimization
```

### Stage 1: Blockout
* Analyze reference silhouette, aspect ratio, and bounding box proportions.
* Establish root scale and world orientation (`y`-up, centered on origin).

### Stage 2: Structural Hierarchy
* Decompose into parent-child `THREE.Group` tree:
  ```typescript
  const root = new THREE.Group();
  const bodyGroup = new THREE.Group();
  const headGroup = new THREE.Group();
  const accentGroup = new THREE.Group();
  root.add(bodyGroup, headGroup, accentGroup);
  ```
* Place pivot points at actual physical rotation axes (e.g., base of neck, shoulder hinge, wheel axle).

### Stage 3: Form Sculpting
* Combine Three.js procedural geometries:
  * `BoxGeometry` with bevel / corner curves.
  * `CylinderGeometry` / `ConeGeometry` / `TorusGeometry`.
  * `ExtrudeGeometry` with `THREE.Shape` for bespoke 2D vector silhouettes.
  * `LatheGeometry` for rotational symmetric bodies (vases, cups, barrels).
  * Compound shapes with smooth union composition.

### Stage 4: Materials & Shading
* Use `THREE.MeshStandardMaterial` or `THREE.MeshPhysicalMaterial`:
  * `roughness`: 0.1 (polished chrome/glass) to 0.9 (matte plastic/cloth).
  * `metalness`: 0.0 (dielectric) to 1.0 (metallic).
  * `transmission`, `ior`, `thickness` for translucent or glass surfaces.
  * Procedural canvas textures or gradients for fine surface noise.

### Stage 5: Surface Details & Greebles
* Add micro-details: seams, bolts, bevel highlights, insets, indicator lights.
* Use emissive properties (`emissive`, `emissiveIntensity`) for neon or LED accents.

### Stage 6: Self-Contained Lighting
* Set up balanced lighting if rendered standalone:
  * Key light (`DirectionalLight` with soft shadows).
  * Fill light (soft warm/cool ambient).
  * Rim light to accentuate silhouettes against dark backdrops.

### Stage 7: Interaction & Animation Hooks
* Expose an animation loop interface on `root.userData`:
  ```typescript
  root.userData.update = (delta: number, elapsed: number) => {
    // Floating, pulsing, rotating, or articulated motion
    bodyGroup.position.y = Math.sin(elapsed * 2) * 0.05;
    accentGroup.rotation.y = elapsed * 0.5;
  };
  ```

### Stage 8: Optimization & Disposal
* Merge static meshes using `BufferGeometryUtils.mergeGeometries` where appropriate.
* Enable geometry and material disposal handlers (`dispose()`) to prevent WebGL memory leaks.

---

## 3. Standard TypeScript Factory Pattern

Every generated 3D model should follow this reusable factory pattern:

```typescript
import * as THREE from 'three';

export interface ModelOptions {
  primaryColor?: string | number;
  accentColor?: string | number;
  scale?: number;
  wireframe?: boolean;
}

export interface ReconstructedModel {
  group: THREE.Group;
  update: (delta: number, elapsed: number) => void;
  dispose: () => void;
}

export function createProceduralModel(options: ModelOptions = {}): ReconstructedModel {
  const {
    primaryColor = 0x3b82f6,
    accentColor = 0x60a5fa,
    scale = 1,
    wireframe = false,
  } = options;

  const group = new THREE.Group();
  group.scale.set(scale, scale, scale);

  // Geometries
  const mainGeo = new THREE.BoxGeometry(1, 1, 1);
  const accentGeo = new THREE.TorusGeometry(0.7, 0.05, 16, 100);

  // Materials
  const mainMat = new THREE.MeshStandardMaterial({
    color: primaryColor,
    roughness: 0.3,
    metalness: 0.8,
    wireframe,
  });

  const accentMat = new THREE.MeshStandardMaterial({
    color: accentColor,
    roughness: 0.2,
    metalness: 0.9,
    emissive: accentColor,
    emissiveIntensity: 0.4,
  });

  const mainMesh = new THREE.Mesh(mainGeo, mainMat);
  const accentMesh = new THREE.Mesh(accentGeo, accentMat);
  accentMesh.rotation.x = Math.PI / 2;

  group.add(mainMesh, accentMesh);

  const update = (delta: number, elapsed: number) => {
    group.rotation.y += delta * 0.5;
    accentMesh.rotation.z = elapsed * 0.8;
  };

  const dispose = () => {
    mainGeo.dispose();
    accentGeo.dispose();
    mainMat.dispose();
    accentMat.dispose();
  };

  return { group, update, dispose };
}
```

---

## 4. Integration with Next.js & React Three Fiber

When using with React Three Fiber (`@react-three/fiber`):
```tsx
'use client';

import React, { useRef, useEffect } from 'react';
import { useFrame } from '@react-three/fiber';
import * as THREE from 'three';
import { createProceduralModel } from './model';

export function ProceduralCanvasModel() {
  const mountRef = useRef<THREE.Group>(null);
  const modelRef = useRef<ReturnType<typeof createProceduralModel> | null>(null);

  useEffect(() => {
    const model = createProceduralModel();
    modelRef.current = model;
    if (mountRef.current) {
      mountRef.current.add(model.group);
    }
    return () => {
      model.dispose();
      model.group.removeFromParent();
    };
  }, []);

  useFrame((_, delta) => {
    if (modelRef.current) {
      modelRef.current.update(delta, performance.now() * 0.001);
    }
  });

  return <group ref={mountRef} />;
}
```

