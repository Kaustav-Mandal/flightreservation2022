<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Register User</title>
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
              <div class="card" style="border-radius: 15px">
                <div class="card-body p-5">
                  <h2 class="text-uppercase text-center mb-5">
                    Register yourself
                  </h2>

                  <form class="needs-validation" action="registerUser" method="post" novalidate>
                    <div class="form-outline mb-4">
                      <input
                        type="text"
                        name="firstName"
                        class="form-control form-control-lg"
                        required
                      />
                      <label class="form-label" for="form_firstName"
                        >First name</label
                      >
                      <div class="invalid-feedback">
                        You must specify your first name
                      </div>
                    </div>

                    <div class="form-outline mb-4">
                      <input
                        type="text"
                        name="lastName"
                        class="form-control form-control-lg"
                        required
                      />
                      <label class="form-label" for="form_lastName"
                        >Last name</label
                      >
                      <div class="invalid-feedback">
                        You must specify your last name
                      </div>
                    </div>

                    <div class="form-outline mb-4">
                      <input
                        type="email"
                        name="email"
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
                        type="password"
                        name="password"
                        class="form-control form-control-lg"
                        required
                      />
                      <label class="form-label" for="form_password"
                        >Password</label
                      >
                      <div class="invalid-feedback">Password is required</div>
                    </div>

                    <div class="form-outline mb-4">
                      <input
                        type="password"
                        name="confirmPassword"
                        class="form-control form-control-lg"
                        required
                      />
                      <label class="form-label" for="form_cnfPassword"
                        >Repeat your password</label
                      >
                      <div class="invalid-feedback">Repeat the password</div>
                    </div>

                    <div class="form-check d-flex justify-content-center mb-5">
                      <input
                        class="form-check-input me-2"
                        type="checkbox"
                        value=""
                        id="form2Example3cg"
                      />
                      <label class="form-check-label" for="form2Example3g">
                        I agree all statements in
                        <a href="#!" class="text-body"
                          ><u>Terms of service</u></a
                        >
                      </label>
                    </div>

                    <div class="d-flex justify-content-center">
                      <button
                        type="submit"
                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"
                      >
                        Register
                        <i class="fas fa-chevron-right me-2"></i>
                      </button>
                    </div>

                    <p class="text-center text-muted mt-5 mb-0">
                      Have already an account?
                      <a href="#!" class="fw-bold text-body"
                        ><u>Login here</u></a
                      >
                    </p>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- MDB -->
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"
    ></script>
    <script type="text/javascript">
      (() => {
        'use strict';

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
      })();
    </script>
  </body>
</html>
