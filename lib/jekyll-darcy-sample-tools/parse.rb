module JekyllDarcySampleTools

    def self.split_hex_color_list(hex_codes)
        hex_codes.split(/[\,,\n]/).map { |hex_str|
            hex_str.strip!
            hex_str.downcase!
            hex_str = hex_str[1..-1] if hex_str[0] == '#'
            
            if hex_str[/\A\h{6}\z/]
                rgb = hex_str.scan(/../).map { |byte_str| byte_str.to_i(16) }
                { "r" => rgb[0], "g" => rgb[1], "b" => rgb[2] }
            else
                nil
            end
        }.compact
    end

    def self.parse_colors(hex_codes)
        rgb_values = split_hex_color_list(colors)
    end
    
end
