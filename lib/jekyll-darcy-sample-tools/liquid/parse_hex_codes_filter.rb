module JekyllDarcySampleTools
    module ParseHexCodesFilter

        def parse_hex_codes(input)
            JekyllDarcySampleTools::split_hex_color_list(input)
        end

    end
end
Liquid::Template.register_filter(JekyllDarcySampleTools::ParseHexCodesFilter)