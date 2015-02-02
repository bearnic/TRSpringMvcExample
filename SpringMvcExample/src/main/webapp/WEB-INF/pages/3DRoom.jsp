

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>My 3d Plane with custom texture</title>
	</head>
	<body>
		<script src="http://threejs.org/build/three.min.js"></script>
		<script src="https://dl.dropboxusercontent.com/u/3587259/Code/Threejs/OrbitControls.js"></script>
		
		<div id="container"></div>  
		
		<script>
			var container, stats;
			var geometry, material;
			var plane, windowWallPlane, floorPlane, ambientLight, directionalLight;
			var camera, controls, scene, renderer;
			var windowTexture, floorTexture;
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
  				
    			//create a plane
 				geometry = new THREE.PlaneGeometry( 500, 500, 500 );
 				material = new THREE.MeshBasicMaterial({
 					color: 0xff0000,
 					side: THREE.DoubleSide
 					});
  
 				plane = new THREE.Mesh( geometry, material );
				scene.add( plane );
    			
				//create a wall
 				geometry = new THREE.PlaneGeometry( 500, 500, 20 );
 				//windowTexture = THREE.ImageUtils.loadTexture("http://regdev.isinet.com:11180/repos/cms/SpringMvcExample/src/main/webapp/resources/mytheme/images/window-wall.jpg");
 				material = new THREE.MeshBasicMaterial({
 					//map:windowTexture,
 					color: 0xffffff,
 					side: THREE.DoubleSide
 					});
  
 				windowWallPlane = new THREE.Mesh( geometry, material );
				scene.add( windowWallPlane );
				
				windowWallPlane.position.y -= 0;
				windowWallPlane.rotation.y += Math.PI / 2;;
				
				
 				//create floor
 				geometry = new THREE.PlaneGeometry( 500, 500, 20 );
 				//windowTexture = THREE.ImageUtils.loadTexture("window-wall.jpg");
 				material = new THREE.MeshLambertMaterial({
 					//map:windowTexture,
 					color: 0xffffff,
 					side: THREE.DoubleSide
 					});
 				//material.map.needsUpdate = true;
 				floorPlane = new THREE.Mesh( geometry, material );
				scene.add( floorPlane );
				
				floorPlane.rotation.x += Math.PI / 2;
				//-----------------------------------------------------------------------
				//Cant seem to add the texture to the mesh. Something to do with CORS i think
				//----------------------------------------------------------------------------
				//add ground
				//geometry = new THREE.PlaneGeometry( 500, 200, 320 );
 				//floorTexture = new THREE.ImageUtils.loadTexture('http://regdev.isinet.com:11180/repos/cms/SpringMvcExample/src/main/webapp/resources/mytheme/images/floor_wood_hardwood.jpg');
 				//floorTexture.needsUpdate = true;
 				//material = new THREE.MeshLambertMaterial({
 				//	map:floorTexture
 				//	});
 				//material.map.needsUpdate = true;
  
 				//floorPlane = new THREE.Mesh( geometry, material );
				//scene.add( floorPlane );
				
				//floorPlane.position.z += 500;
				
				
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
				
				renderer.render(scene, camera);
			}
			
			function render() 
			{
  				renderer.render( scene, camera );
  			}
		</script>
	</body>
</html>      