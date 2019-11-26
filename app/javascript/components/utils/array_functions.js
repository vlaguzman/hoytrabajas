const removeItemFromArr = ( arr, item ) => {
    var i = arr.indexOf( item );
 
    if ( i !== -1 ) {
        arr.splice( i, 1 );
    }
}

export { removeItemFromArr }
