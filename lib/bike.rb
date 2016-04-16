class Bike

attr_accessor :broken

    def working?
      !broken
    end

    def report_broken
      @broken = true
    end

    def broken?
      broken
    end

    def fix
      !broken
    end

end
