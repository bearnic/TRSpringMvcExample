<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
	<head>
		<title>My 3d interactive</title>
	</head>
	<body>
		<script src="http://threejs.org/build/three.min.js"></script>
		<script src="https://dl.dropboxusercontent.com/u/3587259/Code/Threejs/OrbitControls.js"></script>
		
		<div id="container"></div>  
		
		<script>
			var container, stats;
			var geometry, material, mesh, mesh2;
			var torusKnot,torusKnot2, plane, ambientLight, directionalLight;
			var camera, controls, scene, renderer;
			var cross;

			init();
			animate();

			function init()
			{
				camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
    			camera.position.z = 1000;

    			controls = new THREE.OrbitControls( camera );
    			controls.addEventListener( 'change', render );
    			scene = new THREE.Scene();
			
    			//First box
    			geometry = new THREE.BoxGeometry(200, 600, 200);
    			material = new THREE.MeshLambertMaterial({
    				color: 0xff0000
    				});
  				
    			mesh = new THREE.Mesh(geometry, material);
  				scene.add(mesh);
  				
  				//second box
  				geometry = new THREE.BoxGeometry(300, 200, 300);
  				material = new THREE.MeshBasicMaterial({
  					color: 0xff0000,
  					wireframe: true
  					});

  				mesh2 = new THREE.Mesh(geometry, material);
 				scene.add(mesh2);
  				
 				//create a plane
 				geometry = new THREE.PlaneGeometry( 50, 200, 320 );
 				material = new THREE.MeshBasicMaterial({
 					color: 0xffff00,
 					side: THREE.DoubleSide
 					});
  
 				plane = new THREE.Mesh( geometry, material );
				scene.add( plane );
				
				//This will add a torus knot to the scene
				geometry = new THREE.TorusKnotGeometry();
				material = new THREE.MeshLambertMaterial( { color: 0xffffff} );
				torusKnot = new THREE.Mesh( geometry, material );
				scene.add( torusKnot );
				
				//adding a torus knot made out of mesh for comparison
				geometry = new THREE.TorusKnotGeometry();
				material = new THREE.MeshBasicMaterial({
					color: 0xffffff,
					wireframe: true
					});
				
				torusKnot2 = new THREE.Mesh( geometry, material );
				scene.add( torusKnot2 );
				
				//Adding the spehere geometry
				geometry = new THREE.SphereGeometry( 100, 320, 15 );
				material = new THREE.MeshLambertMaterial({
					color: 0xffff00
					});
				
				sphere = new THREE.Mesh( geometry, material );
				scene.add( sphere );
				
				//Adding the lighting to the scene to see the lambert material
				// add subtle blue ambient lighting
				ambientLight = new THREE.AmbientLight(0x000044);
				scene.add(ambientLight);
				
				// directional lighting
				directionalLight = new THREE.DirectionalLight(0xffffff);
				directionalLight.position.set(1, 1, 1).normalize();
				scene.add(directionalLight);
				
				// camera lighting
				cameraGlow = new THREE.DirectionalLight(0xffffff);
				cameraGlow.position.set(camera.position);
				scene.add(cameraGlow);
  
				//This changes the position of the first box and the torus knot
				mesh.position.x += 500;
				mesh.position.z -= 500;
				torusKnot.position.x -= 500;
				torusKnot2.position.x -= 500;
				torusKnot2.position.z -= 500;
				torusKnot2.position.y -= 400;
				sphere.position.y += 300;
				sphere.position.x -= 300;
				sphere.position.z -= 300;

				// renderer
				renderer = new THREE.WebGLRenderer({
					antialias: false 
					});
				renderer.setSize( window.innerWidth, window.innerHeight );
				
				container = document.getElementById( 'container' );
				container.appendChild( renderer.domElement );
				
				window.addEventListener( 'resize', onWindowResize, false );
			}
			
			function onWindowResize() 
			{
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				
				renderer.setSize( window.innerWidth, window.innerHeight );
				render();
			}

			function animate() 
			{
				requestAnimationFrame( animate );
				controls.update();
				
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
			
			function render() 
			{
  				renderer.render( scene, camera );
  			}
		</script>
	</body>
</html>