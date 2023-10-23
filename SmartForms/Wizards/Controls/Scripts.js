; (function () {
    var demo = window.demo = window.demo || {},
        $ = $telerik.$,
        lblDeparture = null,
        lblDepDate = null,
        lblDepName = null,
        lblDepBaggage = null,
        lblDepPrice = null,
        lblArrival = null,
        lblArrDate = null,
        lblArrName = null,
        lblArrBaggage = null,
        lblArrPrice = null,
        rlbDeparture = null,
        rlbArrival = null,
        lblTotalPrice = null;

    demo.clientLoad = function (sender) {
        var wizardElement = sender.get_element();
        var $lblDeparture = $(wizardElement).find('[id$=\'lblDeparture\']');

        lblDeparture = $get($lblDeparture[0].id);
        var $lblDepDate = $(wizardElement).find('[id$=\'lblDepDate\']');

        lblDepDate = $get($lblDepDate[0].id);
        var $lblDepName = $(wizardElement).find('[id$=\'lblDepName\']');

        lblDepName = $get($lblDepName[0].id);
        var $lblDepBaggage = $(wizardElement).find('[id$=\'lblDepBaggage\']');

        lblDepBaggage = $get($lblDepBaggage[0].id);
        var $lblDepPrice = $(wizardElement).find('[id$=\'lblDepPrice\']');

        lblDepPrice = $get($lblDepPrice[0].id);
        var $lblArrival = $(wizardElement).find('[id$=\'lblArrival\']');

        lblArrival = $get($lblArrival[0].id);
        var $lblArrDate = $(wizardElement).find('[id$=\'lblArrDate\']');

        lblArrDate = $get($lblArrDate[0].id);
        var $lblArrName = $(wizardElement).find('[id$=\'lblArrName\']');

        lblArrName = $get($lblArrName[0].id);
        var $lblArrBaggage = $(wizardElement).find('[id$=\'lblArrBaggage\']');

        lblArrBaggage = $get($lblArrBaggage[0].id);
        var $lblArrPrice = $(wizardElement).find('[id$=\'lblArrPrice\']');

        lblArrPrice = $get($lblArrPrice[0].id);
        var $lblTotalPrice = $(wizardElement).find('[id$=\'lblTotalPrice\']');

        lblTotalPrice = $get($lblTotalPrice[0].id);

        var $rlbDeparture = $(wizardElement).find('[id$=\'rlbDeparture\']');

        rlbDeparture = $find($rlbDeparture[0].id);
        var $rlbArrival = $(wizardElement).find('[id$=\'rlbArrival\']');

        rlbArrival = $find($rlbArrival[0].id);

        for (var i = 1; i < sender.get_wizardSteps().get_count(); i++) {

            sender.get_wizardSteps().getWizardStep(i).set_enabled(false);
        }
    };

    demo.clientButtonClicking = function (sender, args) {

        if (!args.get_nextActiveStep().get_enabled()) {
            args.get_nextActiveStep().set_enabled(true);
        }

        if (args.get_command() === Telerik.Web.UI.WizardCommand.Next) {
            switch (sender.get_activeIndex()) {
                case 0:
                    switchToFlight(sender.get_activeWizardStep(), args.get_nextActiveStep());
                    break;
                case 1:
                    switchToPassangers(sender.get_activeWizardStep(), args.get_nextActiveStep());
                    break;
                case 2:
                    switchToPayment(sender.get_activeWizardStep(), args.get_nextActiveStep());
                    break;
            }
        }
    };

    switchToFlight = function (activeStep, nextActiveStep) {
        var stepElement = nextActiveStep.get_element();

        var $RadDatePicker1 = $(activeStep.get_element()).find('[id$=\'RadDatePicker1\']');
        var RadDatePicker1 = $find($RadDatePicker1[0].id);
        var $RadDatePicker2 = $(activeStep.get_element()).find('[id$=\'RadDatePicker2\']');
        var RadDatePicker2 = $find($RadDatePicker2[0].id);

        fillListeBox(rlbDeparture, RadDatePicker1.get_dateInput().get_selectedDate());
        fillListeBox(rlbArrival, RadDatePicker2.get_dateInput().get_selectedDate());

        var $cmbLeavingFrom = $(activeStep.get_element()).find('[id$=\'cmbLeavingFrom\']');
        var cmbLeavingFrom = $find($cmbLeavingFrom[0].id);
        var $cmbGoingTo = $(activeStep.get_element()).find('[id$=\'cmbGoingTo\']');
        var cmbGoingTo = $find($cmbGoingTo[0].id);

        lblDeparture.innerHTML = cmbLeavingFrom.get_text() + ' - ' + cmbGoingTo.get_text();
        lblArrival.innerHTML = cmbGoingTo.get_text() + ' - ' + cmbLeavingFrom.get_text();
    };

    fillListeBox = function (listBox, selectedDate) {
        var newDepartureItem1 = new Telerik.Web.UI.RadListBoxItem();

        newDepartureItem1.set_text(selectedDate.format('dd/MM/yyyy') + ' 17:15 - 19.15 -<strong>$ 103</strong>');
        newDepartureItem1.set_value('103');
        var selectedDatePlusOne = selectedDate;

        selectedDatePlusOne.setDate(selectedDate.getDate() + 1);
        var newDepartureItem2 = new Telerik.Web.UI.RadListBoxItem();

        newDepartureItem2.set_text(selectedDatePlusOne.format('dd/MM/yyyy') + ' 17:15 - 19.15 -<strong>$ 121</strong>');
        newDepartureItem2.set_value('121');
        listBox.get_items().clear();
        listBox.get_items().add(newDepartureItem1);
        listBox.get_items().add(newDepartureItem2);
    };

    switchToPassangers = function (activeStep, nextActiveStep) {


        lblDepDate.innerHTML = rlbDeparture.get_checkedItems()[0].get_text().substr(0, rlbDeparture.get_checkedItems()[0].get_text().length - 24);
        lblArrDate.innerHTML = rlbArrival.get_checkedItems()[0].get_text().substr(0, rlbArrival.get_checkedItems()[0].get_text().length - 23);

        lblDepPrice.innerHTML = '<strong>$ ' + rlbDeparture.get_checkedItems()[0].get_value() + '</strong>';
        lblArrPrice.innerHTML = '<strong>$ ' + rlbArrival.get_checkedItems()[0].get_value() + '</strong>';

        lblTotalPrice.innerHTML = 'Total Price is <strong>$ ' + (parseInt(rlbDeparture.get_checkedItems()[0].get_value(), 10) + parseInt(rlbArrival.get_checkedItems()[0].get_value(), 10)) + '.00';
    };

    switchToPayment = function (activeStep, nextActiveStep) {

        var $rtbFirstName = $(activeStep.get_element()).find('[id$=\'rtbFirstName\']');
        var rtbFirstName = $find($rtbFirstName[0].id);
        var $rtbLastName = $(activeStep.get_element()).find('[id$=\'rtbLastName\']');
        var rtbLastName = $find($rtbLastName[0].id);

        var $rcbBaggageDep = $(activeStep.get_element()).find('[id$=\'rcbBaggageDep\']');
        var rcbBaggageDep = $find($rcbBaggageDep[0].id);
        var $rcbBaggageArr = $(activeStep.get_element()).find('[id$=\'rcbBaggageArr\']');
        var rcbBaggageArr = $find($rcbBaggageArr[0].id);

        lblDepName.innerHTML = rtbFirstName.get_textBoxValue() + '  ' + rtbLastName.get_textBoxValue();
        lblDepBaggage.innerHTML = 'Baggage - ' + rcbBaggageDep.get_text();
        lblArrName.innerHTML = rtbFirstName.get_textBoxValue() + '  ' + rtbLastName.get_textBoxValue();
        lblArrBaggage.innerHTML = 'Baggage - ' + rcbBaggageArr.get_text();


    };


    demo.clientClicked = function (sender, args) {

        var $radWindow = $('[id$=\'RadWindow1\']');

        radWindow = $find($radWindow[0].id);

        if (!radWindow) {
            radWindow = $find($radWindow[1].id);
        }

        radWindow.show();
    };



})();