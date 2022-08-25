import sys

E=open(sys.argv[1], 'r')
F=open(sys.argv[1]+'_Rnla.out', 'w')
G=open(sys.argv[1]+'nla.stat', 'w')

#barcode file
A=open('/hpc/hub_kops/NLAIII384barcodes.txt', 'r')
D={}
counter=0
for x in A:
	counter+=1
	D[x.rstrip()]=counter	


yesmap=0
nomap=0

for x in E:
	if x.startswith('!@')==False:
		x=x.split('\t')
		try:
			if x[1]!='4':
				yesmap+=1
				name=x[0]
				chrom=x[2]
				pos=x[3]
				mapq=x[4]
				flag=x[1]
				match=x[5]	
				bc=x[11][8:]
				umi=x[11][5:8]
				repeat=x[12]

				if flag == '0':
					flag = "+"
				
				if flag == '16':
					flag = "-"	
					
				print repeat
				print bc
				print D[bc]
				print match	
				if repeat=='XT:A:U' and bc in D.keys() and match=='65M':
					F.write(chrom[3:]+'\t'+str(pos)+'\t'+str(int(pos) + 64)+'\t'+name+'\t'+str(mapq)+'\t'+flag+'\t'+umi+'\t'+str(D[bc])+'\n')

			else:
				nomap+=1
		except:
			print 'error'	

G.write('total reads ='+'\t'+str(yesmap+nomap)+'\n'+'mapped reads ='+'\t'+str(yesmap)+'\n'+'unmapped reads ='+'\t'+str(nomap)+'\n')




