class BankAccount
    @@total_accounts = 0

    def self.total_accounts
        @@total_accounts
    end

    attr_reader :account_num, :checking_balance, :savings_balance, :interest_rate


    def initialize
        @@total_accounts += 2
        @account_num = generate_account_num
        @checking_balance = 0
        @savings_balance = 0
        @interest_rate = 0.01

    end
    
    def deposit (acct_type, amount)
        if acct_type == "checking"
            @checking_balance += amount
        else
            @savings_balance += amount
        end
        return self
    end
    
    def withdraw (acct_type, amount)
        if acct_type == "checking"
            checking = checking_balance
            if checking - amount >= 0
                @checking_balance -= amount
            else
                raise "INSUFFICIENT FUNDS ERROR"
            end
        else
            savings = savings_balance
            if savings - amount >= 0
                @savings_balance -= amount
            else
                raise "INSUFFICIENT FUNDS ERROR"
            end
        end
        self
    end

    def total_balance
        @checking_balance + @savings_balance
    end

    def print_balances
        puts "Checking Account: $#{@checking_balance}"
        puts "Savings Account: $#{@savings_balance}"
        puts "Total: $#{@checking_balance + @savings_balance}"
    end

    def account_information
        puts "Account Number: #{@account_num}"
        balance
        puts "Interest Rate: #{@interest_rate}"
    end
    
    private
        def generate_account_num
            numbers = []
            10.times { numbers << rand(9)}
            numbers.join.to_i
        end
    
end

# myacct = BankAccount.new
# myacct.deposit("checking", 5).withdraw("checking", 3).balance
# myotheracct = BankAccount.new
# puts myotheracct.account_information

# puts "Total Accounts: #{BankAccount.total_accounts}"
