words = { 0 => "Zero",1 => "One",2 => "Two", 3 =>"Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 =>"Nine", 10 => "Ten",
	11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Fourteen", 15 => "Fiveteen", 16 => "Sixteen", 17 => "Seventeen",18 => "Eighteen",19 => "Nineteen",20 => "Twenty",
	21 => "Twenty One", 22 => "Twenty Two", 23 => "Twenty Three", 24 => "Twenty Four", 25 => "Twenty Five", 26 => "Twenty Six", 27 => "Twenty Seven",28 => "Twenty Eight", 29 => "Twenty Nine", 
	30 => "Thirty",31 => "Thirty One",32 => "Thirty Two",33 => "Thirty Three",34 => "Thirty Four",35 => "Thirty Five", 36 => "Thirty Six",37 => "Thirty Seven",38 => "Thirty Eight", 39 => "Thirty Nine",
	40 => "Fourty", 41 => "Fourty One", 42 => "Fourty Two",43 => "Fourty Three",44 => "Fourty Four",45 => "Fourty Five",46 => "Fourty Six",47 => "Fourty Seven",48 => "Fourty Eight",49 => "Fourty Nine",
	50 => "Fifty", 51 => "Fifty One", 52 => "Fifty Two",53 => "Fifty Three",54 => "Fifty Four",55 => "Fifty Five",56 => "Fifty Six",57 => "Fifty Seven",58 => "Fifty Eight",59 => "Fifty Nine", 
	60 => "Sixty", 61 => "Sixty One", 62 => "Sixty Two",63 => "Sixty Three",64 => "Sixty Four",65 => "Sixty Five",66 => "Sixty Six",67 => "Sixty Seven",68 => "Sixty Eight",69 => "Sixty Nine", 
	70 => "Seventy", 71 => "Seventy One", 72 => "Seventy Two",73 => "Seventy Three",74 => "Seventy Four",75 => "Seventy Five",76 => "Seventy Six",77 => "Seventy Seven",78 => "Seventy Eight",79 => "Seventy Nine", 
	80 => "Eighty",  81 => "Eighty One", 82 => "Eighty Two",83 => "Eighty Three",84 => "Eighty Four",85 => "Eighty Five",86 => "Eighty Six",87 => "Eighty Seven",88 => "Eighty Eight",89 => "Eighty Nine",
	90 => "Ninety",  91 => "Ninety One", 92 => "Ninety Two",93 => "Ninety Three",94 => "Ninety Four",95 => "Ninety Five",96 => "Ninety Six",97 => "Ninety Seven",98 => "Ninety Eight",99 => "Ninety Nine",
	 "&" => "and",100 => "Hundred", 1000 => "Thousand", 1000000 => "Million", 1000000000 => "Trillion", "-" => "Negative"}

puts "The number here: "
num = []
first_get = gets.chomp.split("")

if first_get[0] == "-"
  neg_num = first_get[1..-1].map(&:to_i)
   first_two = neg_num.first(2).join.to_i
last_two = neg_num.last(2).join.to_i
t_next = [neg_num[1],neg_num[2]].join.to_i
t_1_m_next = [neg_num[2],neg_num[3]].join.to_i
t_2_m_next = [neg_num[3],neg_num[4]].join.to_i
t_3_next = [neg_num[4],neg_num[5]].join.to_i
t_4_next = [neg_num[5],neg_num[6]].join.to_i
convertor = []
if neg_num.length == 1
		convertor.push([words["-"],words[neg_num[0]]].join(" "))	
	elsif neg_num.length == 2
		convertor.push([words["-"],words[first_two]].join(" "))
	elsif neg_num.length == 3	
		 convertor.push([words["-"],words[neg_num[0]],words[100],words["&"],words[last_two]].join(" "))
	elsif neg_num.length == 4	
		convertor.push ([words["-"],words[neg_num[0]],words[1000],words[neg_num[1]],words[100], words["&"],words[last_two]].join(" "))
	elsif neg_num.length == 5	
				convertor.push([words["-"],words[first_two],words[1000],words[neg_num[2]],words[100], words["&"],words[last_two]].join(" "))				
	elsif neg_num.length == 6
	      convertor.push([words["-"],words[neg_num[0]],words[100],words["&"],words[t_next],words[1000],words[neg_num[3]],words[100],words["&"],words[last_two]].join(" "))	
	elsif neg_num.length == 7
		convertor.push ([words["-"],words[neg_num[0]],words[1000000],words[neg_num[1]],words[100],words["&"],words[t_1_m_next],words[1000],words[neg_num[4]],words[100],words["&"],words[last_two]].join(" "))
	elsif neg_num.length == 8
		 convertor.push([words["-"],words[first_two],words[1000000],words[neg_num[2]],words[100],words["&"],words[t_2_m_next],words[1000],words[neg_num[5]],words[100],words["&"],words[last_two]].join(" ")) 
	elsif neg_num.length == 9
		convertor.push([words["-"],words[neg_num[0]],words[100],words["&"],words[t_next],words[1000000],words[neg_num[3]],words[100],words["&"],words[t_3_next],words[1000],words[neg_num[6]],words[100],words["&"],words[last_two]].join(" "))	 	      		 	      
	elsif neg_num.length == 10
		convertor.push([words["-"],words[neg_num[0]],words[1000000000],words[neg_num[1]],words[100],words["&"],words[t_1_m_next],words[1000000],words[neg_num[4]],words[100],words["&"],words[t_4_next],words[1000],words[neg_num[7]],words[100],words["&"],words[last_two]].join(" "))
end		
puts convertor 
end

if first_get[0] != "-"
   num = first_get.map(&:to_i)
   first_two = num.first(2).join.to_i
last_two = num.last(2).join.to_i
t_next = [num[1],num[2]].join.to_i
t_1_m_next = [num[2],num[3]].join.to_i
t_2_m_next = [num[3],num[4]].join.to_i
t_3_next = [num[4],num[5]].join.to_i
t_4_next = [num[5],num[6]].join.to_i
convertor = []
if num.length == 1
		convertor.push([words[num[0]]])	
	elsif num.length == 2
		convertor.push([words[first_two]])
	elsif num.length == 3	
		 convertor.push([words[num[0]],words[100],words["&"],words[last_two]].join(" "))
	elsif num.length == 4	
		convertor.push ([words[num[0]],words[1000],words[num[1]],words[100], words["&"],words[last_two]].join(" "))
	elsif num.length == 5	
				convertor.push([words[first_two],words[1000],words[num[2]],words[100], words["&"],words[last_two]].join(" "))				
	elsif num.length == 6
	      convertor.push([words[num[0]],words[100],words["&"],words[t_next],words[1000],words[num[3]],words[100],words["&"],words[last_two]].join(" "))	
	elsif num.length == 7
		convertor.push ([words[num[0]],words[1000000],words[num[1]],words[100],words["&"],words[t_1_m_next],words[1000],words[num[4]],words[100],words["&"],words[last_two]].join(" "))
	elsif num.length == 8
		 convertor.push([words[first_two],words[1000000],words[num[2]],words[100],words["&"],words[t_2_m_next],words[1000],words[num[5]],words[100],words["&"],words[last_two]].join(" ")) 
	elsif num.length == 9
		convertor.push([words[num[0]],words[100],words["&"],words[t_next],words[1000000],words[num[3]],words[100],words["&"],words[t_3_next],words[1000],words[num[6]],words[100],words["&"],words[last_two]].join(" "))	 	      		 	      
	elsif num.length == 10
		convertor.push([words[num[0]],words[1000000000],words[num[1]],words[100],words["&"],words[t_1_m_next],words[1000000],words[num[4]],words[100],words["&"],words[t_4_next],words[1000],words[num[7]],words[100],words["&"],words[last_two]].join(" "))
end		
puts convertor
end