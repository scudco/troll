class Xzibit

  def yo_dawg_i_heard_you_like(&procs)
    Proc.new { procs.call }
  end

end
