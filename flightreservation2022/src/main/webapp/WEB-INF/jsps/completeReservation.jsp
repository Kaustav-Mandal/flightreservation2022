<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Complete Reservation</title>
    <!-- <link href="css/custom.css" rel="stylesheet"> -->
    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
      rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      rel="stylesheet"
    />
    <!-- MDB -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/style.css" />
  </head>
<body>
<h2>Complete Reservation</h2>
Airline: ${flight.operatingAirlines}<br/>
Departure City: ${flight.departureCity}<br/>
Arrival City: ${flight.arrivalCity}<br/>

    <section
      class="vh-100 bg-image"
      style="
        background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');
      "
    >
      <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
          <div
            class="row d-flex justify-content-center align-items-center h-100"
          >
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
              <div class="card" id="journey-card" style="border-radius: 15px">
                <div class="card-body p-5">
                  <h2 class="text-uppercase text-center mb-5">
                    Complete Reservation
                  </h2>

                  <form class="needs-validation" action="completeReservation" method="post" novalidate>
                    <fieldset class="mb-4">
                      <legend>
                        <span class="step">1</span>
                        Passenger details
                      </legend>
                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form3Example1cg"
                          name="passengerFirstName"
                          class="form-control form-control-lg"
                          required
                        />
                        <label class="form-label" for="form3Example1cg"
                          >First name</label
                        >
                        <div class="invalid-feedback">
                          You must specify your first name
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form3Example1cg"
                          name="passengerLastName"
                          class="form-control form-control-lg"
                          required
                        />
                        <label class="form-label" for="form3Example1cg"
                          >Last name</label
                        >
                        <div class="invalid-feedback">
                          You must specify your last name
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="email"
                          id="form_email"
                          name="passengerEmail"
                          class="form-control form-control-lg"
                          required
                        />
                        <label class="form-label" for="form_email"
                          >Your Email</label
                        >
                        <div class="invalid-feedback">
                          Please use a valid email
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form_phoneNumber"
                          name="passengerPhone"
                          class="form-control form-control-lg"
                          maxlength="10"
                          required
                        />
                        <label class="form-label" for="form_phoneNumber"
                          >Phone number</label
                        >
                        <div class="invalid-feedback">
                          Phone number is required
                        </div>
                      </div>
                    </fieldset>
                    <fieldset>
                      <legend>
                        <span class="step">2</span>
                        Card details
                      </legend>
                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form_cardHolder"
                          name="nameOnTheCard"
                          class="form-control form-control-lg"
                          required
                        />
                        <label class="form-label" for="form_cardHolder"
                          >Name on the card</label
                        >
                        <div class="invalid-feedback">
                          You must specify a valid card holder
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form_cardNumber"
                          name="cardNumber"
                          class="form-control form-control-lg"
                          placeholder="0000-0000-0000-0000"
                          maxlength="16"
                          required
                        />
                        <label class="form-label" for="form_cardNumber"
                          >Card number</label
                        >
                        <div class="invalid-feedback">
                          You must specify a valid card
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="text"
                          id="form_expireDate"
                          name="expirationDate"
                          class="form-control form-control-lg"
                          placeholder="03/24"
                          maxlength="4"
                          required
                        />
                        <label class="form-label" for="form_expireDate"
                          >Expiry date</label
                        >
                        <div class="invalid-feedback">
                          Expiry date is required
                        </div>
                      </div>

                      <div class="form-outline mb-4">
                        <input
                          type="number"
                          id="form_cvvCode"
                          name="securityCode"
                          class="form-control form-control-lg cvv-control"
                          placeholder="456"
                          maxlength="3"
                          required
                        />
                        <label class="form-label" for="form_cvvCode"
                          >3 Digit Security Code</label
                        >
                        <div class="invalid-feedback">
                          Secure code is required
                        </div>
                      </div>
                    </fieldset>

                    <div class="d-flex justify-content-center">
                    <input type="hidden" name="flightId" value="${flight.id}"/>
                      <button
                        type="submit"
                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                      >
                        Confirm
                        <i class="fas fa-chevron-right me-2"></i>
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- jQuery -->
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
    ></script>
    <!-- MDB -->
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"
    ></script>
    <script src="http://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>
    <script type="text/javascript">
      $(() => {
        'use strict';

        // Restrict Card number, expire date and phone number length
        $('#form_cardNumber').mask('0000-0000-0000-0000');
        $('#form_expireDate').mask('00/00');
        $('#form_phoneNumber').mask('0000000000');

        // Restrict CVV field upto 3 characters
        document.querySelector('.cvv-control').addEventListener(
          'keypress',
          (event) => {
            const cvvControlElVal = document.querySelector('.cvv-control');
            cvvControlElVal.value.length === 3 && event.preventDefault();
          },
          false
        );

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation');

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach((form) => {
          form.addEventListener(
            'submit',
            (event) => {
              if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            },
            false
          );
        });
      });
    </script>

</body>
</html>