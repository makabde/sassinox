module SassinoxSupport
  def install_sassinox(path = nil)
    if path
      run_simple("bundle exec sassinox install --path '#{path}'")
    else
      run_simple("bundle exec sassinox install")
    end
  end

  def sassinox_path(prefix, path)
    if prefix
      File.join(prefix, 'sassinox', path)
    else
      File.join('sassinox', path)
    end
  end
end

World(SassinoxSupport)
