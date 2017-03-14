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

      $("#filter-button2").click(function(){
        $("#filter-form2").toggle();
      });

      $("#filter-trans").click(function(){
        $("#filter-form-trans").toggle();
      });
      $("#filter-basic").click(function(){
        $("#filter-form-basic").toggle();
      });

      $("#filter-button").click(function(){
        $("#filter-form").toggle();
      });

      $("#filter-submit").click(function(event){
        event.preventDefault();
        getSearchResults();
        return false;
      });

      function getSearchResults(){
        var styleCheckboxes = $.map(jQuery("[name='styles[]']:checked"), function(i, el) {
          return $(i).val();
        });
        var trans_typeCheckboxes = $.map(jQuery("[name='trans_types[]']:checked"), function(i, el) {
          return $(i).val();
        });
        var trans_speedsCheckboxes = $.map(jQuery("[name='trans_speeds[]']:checked"), function(i, el) {
          return $(i).val();
        });
        var driveCheckboxes = $.map(jQuery("[name='drive[]']:checked"), function(i, el) {
          return $(i).val();
        });

        $.ajax({
          type: "GET",
          url: "/cars",
          data: {
            "car[brand]": jQuery("#_cars_brand").val(),
            "car[price]": jQuery("#_cars_price").val(),
            "car[odometer]": jQuery("#_cars_odometer").val(),
            "car[year]": jQuery("#_cars_year").val(),
            "car[trans_type][]": trans_typeCheckboxes,
            "car[trans_speeds][]": trans_speedsCheckboxes,
            // "car[size]": jQuery("#_cars_size").val(),
            "car[style][]": styleCheckboxes,
            // "car[doors]": jQuery("#_cars_doors").val(),
            "car[drive][]": driveCheckboxes,

          },
          success: function(data) {
            var results = jQuery(data).find('#js_results').html();
            console.log(results);
            jQuery('#js_results').html(results);
          }
        });
      };

      $(".js-brand-basic-single").select2({
        dropdownAutoWidth: true,
        width: '100%',
        height: '36px'
      });

    });




