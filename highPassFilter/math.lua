--[[
    Calculations for parameter values 
    for high pass Butterworth filter
]]

require 'gnuplot'
csv = require 'csv2tensor'

f = 100 -- Corner frequency
Q = 1/torch.sqrt(2)  -- W of butterworth filter by definition
K = 2 -- high pass gain

--[[
    By constraint of butterworth and equal capacitance we have

    1/Q = (1-K)*sqrt(R4/R2) + sqrt(R2/R4)

    We also have 

    2*pi*f = 1/(sqrt(R2*R4*C^2))
]]


function getR4(R2) 
    return (3+torch.sqrt(5))*R2
end

function getC(R2) 
    local R4 = getR4(R2)
    local C = torch.sqrt(1/(R4*R2*(2*math.pi*f)^2))
    return C, R4
end

print(getC(1.48e3))


function getf(R2,R4,C)
    return 1/(torch.sqrt(R2*R4*C^2))/2/math.pi
end

-- get theoretical frequency with binned components

print(getf(1.5e3,7.8e3,470e-9))

-- get theoretical frequency with measured components

print(getf(1.5e3,7.01e3,487e-9))

sim = csv.load('sim.csv'):t()

-- sim[2] = torch.pow(10,sim[2]:div(20))
-- gnuplot.figure(1)
gnuplot.pdffigure('simResponse.pdf')
gnuplot.plot({sim[1],sim[2],'-'})
gnuplot.xlabel('Frequency (Hz)')
gnuplot.ylabel('Magnitude (dB)')
gnuplot.title('Simulated Magnitude Response of a High Pass Filter')
gnuplot.grid(true)
gnuplot.plotflush()

-- Result of measurement

freq = csv.load('freq.csv'):t()

db3  = torch.Tensor(freq[2]:numel()):fill(-3)

-- gnuplot.figure(2)
gnuplot.pdffigure('expResponse.pdf')
gnuplot.plot({{freq[1],freq[2]:log():div(torch.log(10)):mul(20),'-'},{freq[1],db3,'-'}})
gnuplot.xlabel('Frequency (Hz)')
gnuplot.ylabel('Magnitude (dB)')
gnuplot.title('Magnitude Response of a High Pass Filter')
gnuplot.grid(true)
gnuplot.plotflush()
