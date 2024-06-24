ClassicEditor     
	.create( document.querySelector( '#update_content' ) )     
	.then( editor => {
        $(".ck-editor").addClass("w-100")
         console.log( editor );
     } )
     .catch( error => {
         console.error( error );
     } );
