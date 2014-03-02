function ddg_spice_marvel (api_result) {
    if (api_result.error) return;

    Spice.render({
        data              : api_result,
        force_big_header  : true,
        header1           : api_result.name + ' (' + api_result.version + ')',
            source_name       : "marvel.com", // More at ...
            source_url        : 'http://marvel.com/universe/' + api_result.name,
            template_normal   : 'marvel',
            });
        }
