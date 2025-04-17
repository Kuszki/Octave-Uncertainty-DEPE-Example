function [w, wv] = get_aproxvar(coefs, r_amps, r_phis, i_amps = 1, i_phis = 0, dotsh = false, simple = false)

	amps = 2*abs(coefs)/length(coefs);
	phis = arg(coefs);

	if dotsh
		tsh = median(amps)*sqrt(2*log(0.5*length(amps))) / 0.6745;
	else
		tsh = 0;
	end

	if length(i_amps) == 1; i_amps = i_amps * ones(length(r_amps), 1); end
	if length(i_phis) == 1; i_phis = i_phis * ones(length(r_phis), 1); end

	for i = 2 : (length(amps) / 2)

		if amps(i) >= tsh

			if simple
				wv(i) = 0.5 * ((amps(i)*cos(r_phis(i)) - amps(i))^2 + (amps(i)*sin(r_phis(i)))^2);
			else
				wv(i) = 0.5 * ((amps(i)*cos(phis(i)) - amps(i)*i_amps(i)/r_amps(i)*cos(phis(i) - r_phis(i) + i_phis(i)))^2 + ...
			                    (amps(i)*sin(phis(i)) - amps(i)*i_amps(i)/r_amps(i)*sin(phis(i) - r_phis(i) + i_phis(i)))^2);
			end

		else

			wv(i) = 0;

		end

	end

	w = sum(wv);

end
