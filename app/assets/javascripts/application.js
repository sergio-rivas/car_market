//= require jquery
//= require jquery_ujs
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .



 jQuery(function(){

      var input = jQuery('#car_brands_brand_id')

      input.change(function(){
        var brand_text = input.find(":selected").text();

        document.location.href = '/cars/new?brand_name='+brand_text;
      });

      $("#filter-button").click(function(){
        getSearchResults();
        $("#filter-form").toggle()
      });

      function getSearchResults(){
        $.ajax({
          type: "GET",
          url: "/cars",
          data: {
            "car[brand]": jQuery("#_cars_brand").val(),
            "car[price]": jQuery("#_cars_price").val(),
            "car[odometer]": jQuery("#_cars_odometer").val(),
            "car[year]": jQuery("#_cars_year").val(),
            "car[trans_type]": jQuery("#_cars_trans_type").val(),
            "car[trans_speeds]": jQuery("#_cars_trans_speeds").val(),
            "car[size]": jQuery("#_cars_size").val(),
            "car[style]": jQuery("#_cars_style").val(),
            "car[doors]": jQuery("#_cars_doors").val(),
            "car[drive]": jQuery("#_cars_drive").val(),
          },
          success: function(data) {
            var results = jQuery(data).find('#js_results').html();
            console.log(results);
            jQuery('#js_results').html(results);
          }
        });
      }
    });


