require_relative 'bank_account'
RSpec.describe BankAccount do
    before(:each) do
        @bkacct1 = BankAccount.new
        @bkacct1.deposit('savings', 1200)
        @bkacct2 = BankAccount.new
        @bkacct2.deposit('checking', 100)   
    end

    it 'has a getter method for retrieving the checking account balance' do
        expect(@bkacct1.checking_balance).to eq(0)
        expect(@bkacct2.checking_balance).to eq(100)
    end

    it 'has a getter method that retrieves the total account balance' do
        expect(@bkacct1.total_balance).to eq(1200)
        expect(@bkacct2.total_balance).to eq(100)
    end
    
    it 'has a function that allows the user to withdraw cash' do
        @bkacct1.withdraw('savings', 200)
        expect(@bkacct1.savings_balance).to eq(1000)
    end

    it 'raises an error if a user tries to withdraw more money than they have in the account' do
        expect{ @bkacct2.withdraw('checking', 200) }.to raise_error("INSUFFICIENT FUNDS ERROR")
    end

    it 'raises an error when the user attempts to retrieve the total number of bank accounts' do 
        expect{ @bkacct1.total_accounts }.to raise_error(NoMethodError)
    end

    it 'raises an error when the user attempts to set the interest rate' do 
        expect{ @bkacct1.interest_rate = 0.5 }.to raise_error(NoMethodError)
    end
end