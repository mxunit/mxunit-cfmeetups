component  persistent="true" accessors="true"{
	property name="id" fieldtype="id" generator="native";
	property name="firstName";
	property name="lastName";
	property name="company";
	
	property name="attendances" fieldtype="one-to-many" cfc="Attendance"
		fkcolumn="AttendeeID"
		singularname="attendance"
		inverse=true
		cascade="all-delete-orphan";

}
