package main

func generateMonth(month, year int) {

}

func generateYear(year int) {
	for month:=1; month<13; month++ {
		generateMonth(month, year)
	}
}
