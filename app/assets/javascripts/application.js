//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require attachinary
//= require_tree .


 jQuery(function(){
      jQuery('#car_brands_brand_id').change(function(){
        var brand_text = jQuery('#car_brands_brand_id').find(":selected").text();

        document.location.href = '/cars/new?brand_name='+brand_text;
      });
    });
