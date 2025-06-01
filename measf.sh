#!/usr/bin/awk -f

BEGIN { FS="\t"; OFS="\t&\t"; FRAC = 2; REM = 2; }

{
	out = "$" $1 "$"
	
	for (i = 2; i <= 3; i += 1) {
		val_abs = ($i < 0 ? -$i : $i)
		
		dcp = REM;
		cur = 10;
		
		while (val_abs >= cur && dcp > 0) {
			cur = cur * 10;
			dcp = dcp - 1;
		}
		
		rounded = sprintf("%0." dcp "f", $i)
		out = out OFS "$" rounded "$"
	}

	for (i = 4; i <= NF; i += 2) {
		val = $i; unc = $(i+1);
		  
		val_abs = (val < 0 ? -val : val)
		unc = (unc < 0 ? -unc : unc)
		
		b_rounded = sprintf("%." REM "g", unc) + 0.0
		
		if (length(b_rounded) == 1) {
			b_rounded = sprintf("%0." (REM - 1) "f", unc)
		}

		match(b_rounded, /\.(.*)/, dec)
		decimal_places = (RLENGTH > 0) ? length(dec[1]) : 0
		
		if (unc < 1.0 || decimal_places >= FRAC) {
		
			format = "%" FRAC "." FRAC "f"
			b_rounded = sprintf(format, unc)
			a_rounded = sprintf(format, val)
		
		} else if (decimal_places == 0) {
		
			l1 = length(sprintf("%0.0f", val_abs))
			l2 = length(b_rounded)
			lf = l1 - l2 + REM

			if (lf > REM) format = "%0." lf "g"
			else format = "%0.0f"
			
			a_rounded = sprintf(format, val) + 0.0
		
		} else {

			format = "%." decimal_places "f"
			a_rounded = sprintf(format, val)

		}
		
		if (a_rounded == "-0") a_rounded = "0"
		if (a_rounded == "-0.0") a_rounded = "0.0";
		if (a_rounded == "-0.00") a_rounded = "0.00";
		
		out = out OFS "$" a_rounded " \\pm " b_rounded "$"
	 
	 }
	 
	 print out "\t\\\\"
}

