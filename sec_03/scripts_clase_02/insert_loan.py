from biblio.models import Loan

# Crear objetos de préstamo
loan1 = Loan.objects.create(
    user_id=1,
    book_id=1,
    loan_date='2022-01-01',
    due_date='2022-01-15'
)

loan2 = Loan.objects.create(
    user_id=2,
    book_id=2,
    loan_date='2022-02-01',
    due_date='2022-02-15'
)

loan3 = Loan.objects.create(
    user_id=3,
    book_id=3,
    loan_date='2022-03-01',
    due_date='2022-03-15'
)