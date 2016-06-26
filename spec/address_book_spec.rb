  require_relative '../models/address_book'
 
 RSpec.describe AddressBook do
   let(:book) {AddressBook.new}
   #Helper method: consolidate the redundant code
   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end
   
   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
     end
     it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end
 
     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
     end
   end
  describe "#add_entry" do
    let(:book) {AddressBook.new}
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
       expect(book.entries.size).to eq(1)
     end
 
     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end
   # Test that AddressBook's .import_from_csv() method is working as expected
   describe "#import_from_csv" do
     it "imports the correct number of entries" do
       # #3
       book.import_from_csv("entries.csv")
       book_size = book.entries.size
 
       # Check the size of the entries in AddressBook
       expect(book_size).to eq 5
     end
      it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end
  
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end
  
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end
  
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end
  #Assignment: import entries_2.csv
  describe "#import_from_entries_2.csv" do
     it "imports the correct number of entries" do
       book.import_from_csv("entries_2.csv")
       book_size = book.entries.size
       expect(book_size).to eq 3
     end
     it "imports the 2th entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[0]
       check_entry(entry_two, "Ben", "903-222-1918", "ben@hotmail.com")
     end
     it "imports the 3th entry" do
       book.import_from_csv("entries_2.csv")
       entry_three = book.entries[1]
       check_entry(entry_three, "Jane", "434-777-9812", "j.alina@blocmail.com")
     end
     it "imports the 1th entry" do
       book.import_from_csv("entries_2.csv")
       entry_one = book.entries[2]
       check_entry(entry_one, "John", "204-095-8881", "j.doe@gmail.com")
     end
   end
 end