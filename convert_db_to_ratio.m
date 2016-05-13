function ratio = convert_db_to_ratio(db_value, type)

    if strcmp(type, 'amplitude')
        ratio = 10^(db_value/20);
    elseif strcmp(type, 'power')
        ratio = 10^(db_value/10);
    end

