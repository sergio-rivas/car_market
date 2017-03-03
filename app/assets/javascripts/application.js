//= require jquery
//= require jquery_ujs
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-sprockets
//= require_tree .
//= require underscore
//= require gmaps/google


 jQuery(function(){
      jQuery('#car_brands_brand_id').change(function(){
        var brand_text = jQuery('#car_brands_brand_id').find(":selected").text();

        document.location.href = '/cars/new?brand_name='+brand_text;
      });
    });
