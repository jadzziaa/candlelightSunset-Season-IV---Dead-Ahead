MCM_Helpers = {}

function MCM_Helpers.Lerp(a, b, alpha)
	return a + (b-a) * alpha
end

function MCM_Helpers.MakeChildTable(Parent)
	local Child = {}
	setmetatable(Child, {__index = Parent})

	return Child
end

function MCM_Helpers.GetSnappedToGrid(n, grid, min, max)
	grid = math.abs(grid or 0)

	if grid ~= 0 then
		n = math.floor((n / grid) + 0.5) * grid
	end

	if (min ~= nil) and (n < min) then
		n = n + grid
	end

	if (max ~= nil) and (n > max) then
		n = n - grid
	end

	return n
end