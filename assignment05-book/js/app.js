function Book(bookid, bookname, authorname) {
    this.bookid = bookid;
    this.bookname = bookname;
    this.authorname = authorname;
    this.displayDetails = function () {
      return this.bookid + "  " + this.bookname + "  " + this.authorname;
    };
  }
  const Book1 = new Book("15282" , "my_life" , "H S patil");
  const result = document.getElementById("result");
  result.innerHTML = Book1.displayDetails();