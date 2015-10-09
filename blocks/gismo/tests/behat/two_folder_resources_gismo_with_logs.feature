@block @block_gismo
Feature: Using two folder type resources is viewed in GISMO overviews
	In order to enrol one student in course composed by
    two folder type resources
	As a admin
	I need to have the right data on GISMO overviews 
	after use of two folder type resources

	@javascript
	Scenario: Add two folder type resources and access GISMO overviews
		Given the following "courses" exist:
			| fullname | shortname | category |
			| Course 1 | C1 | 0 |
		And the following "users" exist:
			| username | firstname | lastname | email |
			| student1 | Student | 1 | student1@asd.com |
		And the following "course enrolments" exist:
			| user | course | role |
			| student1 | C1 | student |
		And I log in as "admin"
		And I am on homepage
		And I follow "Course 1"
		And I turn editing mode on
		And I add the "Gismo" block
		And I add a "Folder" to section "1" and I fill the form with:
			| Name | Folder 1 |
			| Description | Folder description |
		And I add a "Folder" to section "1" and I fill the form with:
			| Name | Folder 2 |
			| Description | Folder description |
		And I log out
		When I log in as "student1"
		And I am on homepage
		And I follow "Course 1"
		And I follow "Folder 1"
		And I follow "Folder 2"
		And I log out
		Then I log in as "admin"
		And I follow "Course 1"
		And I synchronize gismo data
		And I go to the "Students > Accesses by students" report
		And I go to the "Students > Accesses overview" report
		And I should see "2" on "Students > Accesses overview on resources" report
		And I wait "10" seconds