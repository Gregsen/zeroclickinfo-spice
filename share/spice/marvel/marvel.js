function ddg_spice_marvel (api_result) {
    if (api_result.error) return;

    Spice.render({
        data              : api_result,
        force_big_header  : true,
        header1           : api_result.data.results[0].name,
        source_name       : "marvel.com", // More at ...
        source_url        : api_result.data.results[0].urls[0].url,
        force_no_fold     : true,
        template_normal   : 'marvel'
            });
        }
