function ratio = convert_db_to_ratio(db_value, type)

    % Convert gain or attentuation in db scale to corresponding
    % power or amplitudes ratio. Type can be either set to 'amplitude'
    % or 'power'.

    if strcmp(type, 'amplitude')
        ratio = 10^(db_value/20);
    elseif strcmp(type, 'power')
        ratio = 10^(db_value/10);
    end
