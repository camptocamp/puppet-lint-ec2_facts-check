PuppetLint.new_check(:ec2_facts) do
  def check
    tokens.each do |token|
      if token.type == :VARIABLE and token.value !~ /^(::)?ec2_metadata/ and token.value =~ /^(::)?ec2_/
        notify :warning, {
          :message => 'You should use the new `ec2_metadata` fact',
          :line    => token.line,
          :column  => token.column,
          :token   => token,
        }
      end
    end
  end

  def fix(problem)
    problem[:token].value = "::ec2_metadata['#{problem[:token].value.gsub(/^(::)?ec2_(.*)/, '\2').gsub('_', '-')}']" if problem[:token].value =~ /^::ec2_/
  end
end
