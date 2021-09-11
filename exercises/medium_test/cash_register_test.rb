require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'

SimpleCov.start 
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    # register = CashRegister.new(0)
    # new_t = Transaction.new(10)
    # new_t.amount_paid = 10
    # assert_equal(10, register.accept_money(new_t))

    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 100

    change = register.change(transaction)
    assert_equal(50, change)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)

    text = register.give_receipt(transaction)
    assert_output("You've paid $50.\n") do
      register.give_receipt(transaction)
    end 
  end

end