

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>My 3d Plane with point light</title>
	</head>
	<body>
		<script src="http://threejs.org/build/three.min.js"></script>
		<script src="<c:url value="/resources/js/OrbitControls.js" />"></script>
		<script src="<c:url value="/resources/js/Projector.js" />"></script>
		<script src="<c:url value="/resources/js/CanvasRenderer.js" />"></script>
		
		<div id="container"></div>  
		
		<script>
			var container, stats;
			var geometry, material;
			var plane, windowWallPlane, floorPlane, ambientLight, directionalLight;
			var camera, controls, scene, renderer;
			var windowTexture, floorTexture;
			var cross;
			var spotLight,spotLightHelper;
			var togglePlane;

			init();
			animate();

			function init()
			{
				camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
    			camera.position.z = 1000;

    			controls = new THREE.OrbitControls( camera );
    			controls.addEventListener( 'change', render );
    			scene = new THREE.Scene();
  				
    			addPlanes();
				
				//Adding the lighting to the scene to see the lambert material
				// add subtle blue ambient lighting
				ambientLight = new THREE.AmbientLight(0x000044);
				scene.add(ambientLight);
				
				// directional lighting
				directionalLight = new THREE.DirectionalLight(0xffffff);
				directionalLight.position.set(-200, -200, -200).normalize();
				directionalLight.target.position.set(10, 10, 10).normalize();
				scene.add(directionalLight);
				
				// camera lighting(doesnt seem to be working!)
				cameraGlow = new THREE.DirectionalLight(0xffffff);
				cameraGlow.position.set(camera.position).normailze;
				cameraGlow.target.position.set(10, 10, 10).normalize();
				scene.add(cameraGlow);

				// renderer
				renderer = new THREE.WebGLRenderer({
					antialias: false 
					});
				renderer.setSize( window.innerWidth, window.innerHeight );
				
				container = document.getElementById( 'container' );
				container.appendChild( renderer.domElement );
				
				
				document.addEventListener( 'mousedown', onDocumentMouseDown, false );
				document.addEventListener( 'keydown', onDocumentKeyDown, false );
				document.addEventListener( 'keyup', onDocumentKeyUp, false );
				
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
			
			function onDocumentMouseDown( event ) {

				event.preventDefault();

				mouse.x = ( event.clientX / renderer.domElement.width ) * 2 - 1;
				mouse.y = - ( event.clientY / renderer.domElement.height ) * 2 + 1;

				raycaster.setFromCamera( mouse, camera );

				var intersects = raycaster.intersectObjects( scene.children );

				if ( intersects.length > 0 ) {

					var intersect = intersects[ 0 ];

					if ( isShiftDown ) {

						if ( intersect.object != plane ) {

							scene.remove( intersect.object );

							objects.splice( objects.indexOf( intersect.object ), 1 );

						}

					} else {

						var voxel = new THREE.Mesh( cubeGeometry, cubeMaterial );
						voxel.position.copy( intersect.point ).add( intersect.face.normal );
						voxel.position.divideScalar( 50 ).floor().multiplyScalar( 50 ).addScalar( 25 );
						scene.add( voxel );

						objects.push( voxel );

					}

					render();

				}

			}

			function onDocumentKeyDown( event ) {

				switch( event.keyCode ) {

					case 16: isShiftDown = true;
					spotLight = new THREE.SpotLight(0xffffff, 100, -20, Math.PI, 10);
					spotLight.position.set( 150, 150, 150 );
					spotLight.target.position.set(150, 150, 150);
	 
					scene.add(spotLight);
					
					spotLightHelper	= new THREE.PointLightHelper(spotLight, 1);
					scene.add(spotLightHelper);
					//TO HAVE THE LIGHT RENDER NEED TO ADD THE ELEMNTS ALL OVER AGAIN!!!!!!!!!!!!!!!
					addPlanes();
					
					break;
					
					//click z
					case 90:
						
						scene.remove(spotLight);
						scene.remove(spotLightHelper);
						//scene.remove(new THREE.PointLightHelper(spotLight, 1));
						
						//TO HAVE THE LIGHT RENDER NEED TO ADD THE ELEMNTS ALL OVER AGAIN!!!!!!!!!!!!!!!
						addPlanes();
					
					break;

				}

			}

			function onDocumentKeyUp( event ) {

				switch( event.keyCode ) {

					case 16: isShiftDown = false; 
					
					break;

				}
			}
			
			function addPlanes()
			{
				//create a plane
 				geometry = new THREE.PlaneGeometry( 500, 500, 500 );
 				material = new THREE.MeshLambertMaterial({
 					color: 0xff0000,
 					side: THREE.DoubleSide
 					});
  
 				plane = new THREE.Mesh( geometry, material );
				scene.add( plane );
    			
				//create a wall
 				geometry = new THREE.PlaneGeometry( 500, 500, 500 );
 				//windowTexture = THREE.ImageUtils.loadTexture("http://regdev.isinet.com:11180/repos/cms/SpringMvcExample/src/main/webapp/resources/mytheme/images/window-wall.jpg");
 				material = new THREE.MeshLambertMaterial({
 					//map:windowTexture,
 					color: 0xffffff,
 					side: THREE.DoubleSide
 					});
  
 				windowWallPlane = new THREE.Mesh( geometry, material );
				scene.add( windowWallPlane );
				
				windowWallPlane.rotation.y += Math.PI / 2;;
				
				
 				//create floor
 				geometry = new THREE.PlaneGeometry( 500, 500, 500 );
 				//windowTexture = THREE.ImageUtils.loadTexture("window-wall.jpg");
 				material = new THREE.MeshLambertMaterial({
 					//map:windowTexture,
 					color: 0xffffff,
 					side: THREE.DoubleSide
 					});
 				//material.map.needsUpdate = true;
 				floorPlane = new THREE.Mesh( geometry, material );
				scene.add( floorPlane );
				
				//Use the merging tool to have better performance and merge geometries. need the three.geometryutils library
				//THREE.GeometryUtils.merge(plane, floorPlane);
				
				floorPlane.rotation.x += Math.PI / 2;
			}
		</script>
	</body>
</html>      