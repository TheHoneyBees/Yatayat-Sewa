<html>
    <head>
        <title>Seat Selection</title>
        <link href="seatcss.css" rel="stylesheet" />
    </head>
    <body> 
        
        <script>
            var bookedSeatArray = [];
            var val = 0;
            var fare = 450;
            function validateForm() {
                var x = document.forms["form"]["total"].value;
                if (x === "0") {
                    alert("Seat must be selected");
                    return false;
                }
            }
            // call onload or in script segment below form
            function attachCheckboxHandlers() {


                // get reference to element containing seat_layout checkboxes
                var el = document.getElementById('seat_layout');

                // get reference to input elements in seat_layout container element
                var tops = el.getElementsByTagName('input');
                // assign updateTotal function to onclick property of each checkbox
                for (var i = 0, len = tops.length; i < len; i++) {
                    if (tops[i].type === 'checkbox') {
                        tops[i].onclick = updateTotal;
                    }
                }
            }
            // called onclick of seat_layout checkboxes
            function updateTotal() {
                // 'this' is reference to checkbox clicked on
                var form = this.form;

                // get current value in total text box, using parseFloat since it is a string
                val = parseFloat(form.elements['total'].value);

                // if check box is checked, add its value to val, otherwise subtract it
                var seat = this.id;
                if (this.checked) {
                    bookedSeatArray.push(seat);
                    val += parseFloat(fare);
                    form.elements['bookedseats'].value = bookedSeatArray;

                } else {
                    for (i = 0; i < bookedSeatArray.length; i++) {
                        if (bookedSeatArray[i] === seat) {
                            bookedSeatArray.splice(i, 1);
                            break;
                        }
                    }
                    val -= parseFloat(fare);
                    form.elements['bookedseats'].value = bookedSeatArray;
                }
                // format val with correct number of decimal places
                // and use it to update value of total text box
                form.elements['total'].value = val;
            }
        </script>
        
        <form name="form" action="/book_now" method="post" onsubmit="return validateForm()">
            <fieldset>
                <legend>Seat Layout</legend> <p>
                    <label>Total: Rs <input type="text" name="total"  value="0" readonly="readonly" /></label>
                    <label>Selected Seats <input type="text" name="bookedseats" value="" readonly="readonly" /></label>           
                    <input type="submit" value="Book Now">
                </p>
                <div id="seat_layout">
                    <div class="plane">
                        <div class="cabin">
                            <h3>Please select a seat</h3>
                        </div>
                        <ol class="fuselage">
                            <li class="row row--1">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="1A" />
                                        <label for="1A">1A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="2A" />
                                        <label for="2A">2A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" disabled id="1B" />
                                        <label for="1B">1B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="2B" />
                                        <label for="2B">2B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--2">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="3A" />
                                        <label for="3A">3A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="4A" />
                                        <label for="4A">4A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="3B" />
                                        <label for="3B">3B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="4B" />
                                        <label for="4B">4B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--3">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="5A" />
                                        <label for="5A">5A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="6A" />
                                        <label for="6A">6A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="5B" />
                                        <label for="5B">5B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="6B" />
                                        <label for="6B">6B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--4">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="7A" />
                                        <label for="7A">7A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="8A" />
                                        <label for="8A">8A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="7B" />
                                        <label for="7B">7B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="8B" />
                                        <label for="8B">8B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--5">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="9A" />
                                        <label for="9A">9A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="10A" />
                                        <label for="10A">10A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="9B" />
                                        <label for="9B">9B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="10B" />
                                        <label for="10B">10B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--6">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="11A" />
                                        <label for="11A">11A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="12A" />
                                        <label for="12A">12A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="11B" />
                                        <label for="11B">11B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="12B" />
                                        <label for="12B">12B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--7">
                                <ol class="seats" type="A">
                                    <li class="seat">
                                        <input type="checkbox" id="13A" />
                                        <label for="13A">13A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="14A" />
                                        <label for="14A">14A</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="13B" />
                                        <label for="13B">13B</label>
                                    </li>
                                    <li class="seat">
                                        <input type="checkbox" id="14B" />
                                        <label for="14B">14B</label>
                                    </li>
                                </ol>
                            </li>
                            <li class="row row--8">
                                <ol class="seats" type="A">
                                    <li class="seatlast">
                                        <input type="checkbox" id="L1" />
                                        <label for="L1">L1</label>
                                    </li>
                                    <li class="seatlast">
                                        <input type="checkbox" id="L2" />
                                        <label for="L2">L2</label>
                                    </li>
                                    <li class="seatlast">
                                        <input type="checkbox" id="L3" />
                                        <label for="L3">L3</label>
                                    </li>
                                    <li class="seatlast">
                                        <input type="checkbox" id="L4" />
                                        <label for="L4">L4</label>
                                    </li>
                                    <li class="seatlast">
                                        <input type="checkbox" id="L5" />
                                        <label for="L5">L5</label>
                                    </li>
                                </ol>
                            </li>    
                        </ol>
                    </div>
                </div>
            </fieldset>
        </form>
        <script>attachCheckboxHandlers();</script>
         
    </body>
</html>