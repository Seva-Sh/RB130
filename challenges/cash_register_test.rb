require "minitest/autorun"

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(0)  
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    assert_equal(0, @register.total_money)

    @transaction.amount_paid = 50
    @register.accept_money(@transaction)

    assert_equal(50, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 70
    change = @register.change(@transaction)

    assert_equal(20, change)
  end

  def test_give_receipt
    str = "You've paid $50.\n"
    # output = capture_io do
    #   @register.give_receipt(@transaction)
    # end 
    assert_output(str) {@register.give_receipt(@transaction)}
  end

  def test_prompt_for_payment
    input = StringIO.new("70\n")
    output = StringIO.new('')
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(70, @transaction.amount_paid)
  end
end