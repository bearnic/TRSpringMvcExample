<html>
<head>
<title>My first Three.js app</title>
<style>
body {
	overflow: hidden;
}
</style>
</head>
<body>
	<script src="http://threejs.org/build/three.min.js"></script>

	<script>
		var camera, scene, renderer;
		var geometry, material, mesh, mesh2;
		var torusKnot, torusKnot2, plane, ambientLight, directionalLight;

		init();
		animate();

		function init() 
		{

			camera = new THREE.PerspectiveCamera(75, window.innerWidth
					/ window.innerHeight, 1, 10000);
			camera.position.z = 1000;

			scene = new THREE.Scene();

			//First box
			geometry = new THREE.BoxGeometry(200, 600, 200);
			material = new THREE.MeshLambertMaterial({
				color : 0xff0000
			});

			mesh = new THREE.Mesh(geometry, material);

			scene.add(mesh);

			//second box
			geometry = new THREE.BoxGeometry(300, 200, 300);
			material = new THREE.MeshBasicMaterial({
				color : 0xff0000,
				wireframe : true
			});

			mesh2 = new THREE.Mesh(geometry, material);

			scene.add(mesh2);

			//create a plane
			geometry = new THREE.PlaneGeometry(50, 200, 320);
			material = new THREE.MeshBasicMaterial({
				color : 0xffff00,
				side : THREE.DoubleSide
			});
			plane = new THREE.Mesh(geometry, material);
			scene.add(plane);

			//This will add a torus knot to the scene
			geometry = new THREE.TorusKnotGeometry();
			material = new THREE.MeshLambertMaterial({
				color : 0xffffff
			});
			torusKnot = new THREE.Mesh(geometry, material);
			scene.add(torusKnot);

			//adding a torus knot made out of mesh for comparison
			geometry = new THREE.TorusKnotGeometry();
			material = new THREE.MeshBasicMaterial({
				color : 0xffffff,
				wireframe : true
			});
			torusKnot2 = new THREE.Mesh(geometry, material);
			scene.add(torusKnot2);

			//Adding the spehere geometry

			geometry = new THREE.SphereGeometry(100, 320, 15);
			material = new THREE.MeshLambertMaterial({
				color : 0xffff00
			});
			sphere = new THREE.Mesh(geometry, material);
			scene.add(sphere);

			//Adding the lighting to the scene to see the lambert material
			// add subtle blue ambient lighting
			ambientLight = new THREE.AmbientLight(0x000044);
			scene.add(ambientLight);

			//add some directional ligthting

			// directional lighting
			directionalLight = new THREE.DirectionalLight(0xffffff);
			directionalLight.position.set(1000, 1000, 1000).normalize();
			scene.add(directionalLight);

			//Adding the text geometry

			// geometry = new Three.TextGeometry(Nick);
			//myName = new Three.Mesh(geometry,material);
			//scene.add( myName );

			//This changes the position of the first box and the torus knot
			mesh.position.x += 500;
			torusKnot.position.x -= 500;
			torusKnot2.position.x -= 500;
			torusKnot2.position.y -= 400;
			sphere.position.y += 300;
			sphere.position.x -= 300;

			//This is the renderer
			renderer = new THREE.WebGLRenderer();
			renderer.setSize(window.innerWidth, window.innerHeight);

			document.body.appendChild(renderer.domElement);

		}

		function animate() 
		{

			requestAnimationFrame(animate);

			//This rotates the objects
			mesh.rotation.x += 0.1;
			mesh.rotation.y += 0.02;
			mesh2.rotation.y += 0.1;
			plane.rotation.y -= 0.1;
			torusKnot.rotation.x += 0.1;
			torusKnot2.rotation.x -= 0.1;
			sphere.rotation.y += .1;
			sphere.rotation.x += .1;

			renderer.render(scene, camera);

		}
	</script>


</body>
</html>