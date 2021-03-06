function y = polarizer(x,theta)

    % Model the behavior of a polarizer. Given an input voltage x
    % and an angle 'theta', a corresponding output is produced.

    % Theta is the angle of polarizer. Output is equal to input
    % when angle is 0 degrees and minimum when angle is 90 degrees.

    pos_r = [100;0;0];
    fc = 3e8;
    lclaxes_r = rotx(theta)*azelaxes(180,0);

    ang_t = [0;0];                % receiver at transmitter's boresight
    ang_r = [0;0];                % transmitter at receiver's boresight

    hant_t = phased.ShortDipoleAntennaElement('AxisDirection','Z');
    resp_t = step(hant_t,fc,ang_t);
    hant_r = phased.ShortDipoleAntennaElement('AxisDirection','Z');
    resp_r = step(hant_r,fc,ang_r);

    db_loss = polloss([resp_t.H;resp_t.V],[resp_r.H;resp_r.V],pos_r,lclaxes_r);
    a_ratio = convert_db_to_ratio(-db_loss, 'amplitude');

    y = x*a_ratio;
