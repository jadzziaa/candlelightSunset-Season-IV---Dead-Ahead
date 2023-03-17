function mapRange(input, input_start, input_end, output_start, output_end)
    local output = output_start + ((output_end - output_start) / (input_end - input_start)) * (input - input_start);
    return output;
end