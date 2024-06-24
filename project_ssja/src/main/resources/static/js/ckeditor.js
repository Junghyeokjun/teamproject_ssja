ClassicEditor     
	.create( document.querySelector( '#update_content' ) )     
	.then( editor => {
         console.log( editor );
     } )
     .catch( error => {
         console.error( error );
     } );
