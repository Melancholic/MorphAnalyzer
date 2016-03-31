$(document).on("page:change", function(){
    $('.submit-btn').on('click', function(e){
        var me=this;
        $(this).prop( "disabled", true );
        $(this).submit();
    });
});