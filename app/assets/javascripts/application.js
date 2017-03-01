//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .


 $(function(){
      $('#car_brands_brand_id').change(function(){
        var brand_text = $('#car_brands_brand_id').find(":selected").text();

        document.location.href = '/cars/new?brand_name='+brand_text;
      });
    });
