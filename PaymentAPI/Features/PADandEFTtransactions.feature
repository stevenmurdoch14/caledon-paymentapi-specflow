Feature: Perform PAD/EFT Transactions 

    Scenario: Perform a PAD Debit Transaction
		        
	    Given the user prepares the PAD API "PADDebit" request       
	    When a POST request is performed
	    Then the response code will be response code '202'
        
	Scenario: Perform a PAD Debit Void Transaction
		
		Given a "PADDebit" transaction has been performed
		And the user prepares the PAD API "PADDebitVoid" request      
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform a PAD Account Verification Transaction
		
		Given the user prepares the PAD API "PADAccountVerification" request       
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform an EFT Transaction  (Unique Reference Number Required)
		
		Given the user prepares the PAD API "EFTPayment" request       
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform an PAD Refund Transaction  (PAD Settlement Required)
		
		Given a "PADDebit" transaction has been performed
		Given a "Settlement" transaction has been performed
		And the user prepares the PAD API "PADRefund" request       
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform an PAD Refund Void Transaction  (PADRefundVoid needs new bdd and pre-pre-ref?) Creating new ref at settlement stage...
		
		Given a "PADDebit" transaction has been performed
		And the user prepares the Payment API "Settlement" request       
		When a POST request is performed
		And a "PADRefund" transaction has been performed
		And the user prepares the PAD API "PADRefundVoid" request       
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform a Deactivate/Reactivate Token Transaction
			
		Given a "PADDeactivate" transaction has been performed
		And a "PADDebit" transaction has been performed
		And the response code will be response code '400'
		And a "PADReactivate" transaction has been performed
		And the user prepares the PAD API "PADDebitVoid" request       
		When a POST request is performed
		Then the response code will be response code '202'
		
	Scenario: Perform a Add Token Transaction
		
		Given the user prepares the PAD API "PADAddToken" request       
		When a POST request is performed
		Then the response code will be response code '200'