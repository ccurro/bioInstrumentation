--[[
    Calculations for parameter values 
    for high pass Butterworth filter
]]

require 'gnuplot'
csv = require 'csv'

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

sim = torch.Tensor(3,1000)
f = csv.open("sim.csv")
local line = 1
for fields in f:lines() do
  for i, v in ipairs(fields) do 
    sim[i][line] = tonumber(v)
  end
  line = line + 1
end
f:close()

-- sim[2] = torch.pow(10,sim[2]:div(20))
gnuplot.figure(1)
gnuplot.plot({sim[1],sim[2],'-'})
gnuplot.xlabel('Frequency (Hz)')
gnuplot.ylabel('Magnitude (dB)')
gnuplot.title('Magnitude Response of a High Pass Filter')
gnuplot.grid(true)

-- Result of measurement

freq = torch.Tensor(2,36)
f = csv.open("freq.csv")
local line = 1
for fields in f:lines() do
  for i, v in ipairs(fields) do 
    freq[i][line] = tonumber(v)
  end
  line = line + 1
end
f:close()

db3  = torch.Tensor(freq[2]:numel()):fill(-3)

gnuplot.figure(2)
gnuplot.plot({{freq[1],freq[2]:log():div(torch.log(10)):mul(20),'-'},{freq[1],db3,'-'}})
gnuplot.xlabel('Frequency (Hz)')
gnuplot.ylabel('Magnitude (dB)')
gnuplot.title('Magnitude Response of a High Pass Filter')
gnuplot.grid(true)

