--[[
	Calculations for parameter values 
	for Butterworth filter
]]

require 'gnuplot'

f = 500 -- Cutoff freq of filter
Q = 1/torch.sqrt(2)  -- Q of butterworth filter by definition 

C = 0.259e-6 -- 0.22 microfarads for C2 and C4 (in bins)
-- .259e-6 was the measured amount for two matched caps from .22 bins

--[[

	2pi*f = sqrt(R1*R3*C2*C4)^(-1)

	By the constraint of the Q value for a 
	butterworth filter R3 = 2R1

	I also constrain C2 = C4 

	=> 2pi*f = sqrt(2*R1^2*C^2)^(-1)

	solve for R1

	=> R1 = (1/(2pi*f)^2) / (C^2) / 2

]]

R1 = torch.sqrt((1/(2*math.pi*f)^2) / (C^2) / 2)

print(R1) -- 869

-- 

function getCornerFreq(R) 
	return 1/torch.sqrt(2*R^2*C^2)/2/math.pi
end


print(getCornerFreq(800)) -- 543  --intolerable
print(getCornerFreq(900)) -- 482  --tolerable
print(getCornerFreq(1000)) -- 434 --tolerable

-- Data Aq

-- freq = torch.cat(torch.Tensor(1):fill(10),torch.range(50,1200,50))
-- resp = torch.Tensor({2.00,2.00,2.019,2.044,2.0784,2.120,2.166,2.210,2.242,2.25,2.23,2.169,2.06,1.93,1.78,1.632,1.4822,1.344,1.21,1.0993,.995,.90,.824,.754,.679})
-- in the above I made R1 = R2 = 1e3 by accident

freq = torch.cat(torch.Tensor(1):fill(10),torch.range(50,1000,50))
freq = torch.cat(freq,torch.Tensor(1):fill(10e3))
resp = torch.Tensor({2.00,1.995,1.985,1.97,1.94,1.88,1.81,1.70,1.57,1.42,1.28,1.14,1.018,.905,.805,.721,.646,.581,.525,.476,.433,4.8e-3})
db3  = torch.Tensor(resp:numel()):fill(3)

function mag2db(resp) 
	return resp:clone():log():div(torch.log(10)):mul(20)
end

gnuplot.pdffigure('magResponse.pdf')
gnuplot.plot({freq:narrow(1,1,21),mag2db(resp):narrow(1,1,21),'-'},{freq:narrow(1,1,21),db3:narrow(1,1,21),'-'})
gnuplot.grid(true)
gnuplot.xlabel('Frequency (Hz)')
gnuplot.ylabel('Magnitude (dB)')
gnuplot.title('Magnitude Response of a 2nd Order Butterworth Filter')
gnuplot.plotflush()
