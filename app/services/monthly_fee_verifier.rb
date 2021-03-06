class MonthlyFeeVerifier
  MONTHLY_FEE_BY_PERIODS = {
    6  => 0.5,
    12 => 1.5,
    24 => 3.0,
    48 => 6.0,
  }
  def verify_by_period(period)
    month_fee_by_periods[period.to_i]
  end

  def available_periods
    month_fee_by_periods.keys
  end

  private

  def month_fee_by_periods
    MONTHLY_FEE_BY_PERIODS # came from the constant for now, but can come from a database, config file, api etc.
  end
end
