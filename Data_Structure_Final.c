#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define max 50

struct Node{
	int val, jam, menit;
    char film[25];
    struct Node *next;
};
struct Node *head=NULL;
extern struct Node *sort_list(struct Node *head);
void search(struct Node *head, char kunci[25]); //inisialisasi fungsi search

typedef struct{
	int top;
	int data[max+1];
}stack;

stack tumpukan;
void createEmpty();
int IsEmpty();
int IsFull();
void push(int x);

void label_menu(){
	system("cls");
	printf("\t============================================================\n");
	printf("\t|             SELAMAT DATANG DI ONLINETICKET               |\n");
	printf("\t|             Situs Penjualan Tiket Bioskop.               |\n");
	printf("\t============================================================\n\n");
	printf("\t1. Login sebagai admin\n");
	printf("\t2. Login sebagai user\n");
	printf("\t3. Exit\n");
}

void menu_admin(){
	system("cls");
	printf("\t============================================================\n");
	printf("\t|\t\t\t  MENU ADMIN   \t\t\t   |\n");
	printf("\t============================================================\n\n");
	printf("\t1. Tambah jadwal\n"); //linked list
	printf("\t2. Hapus jadwal\n");
	printf("\t3. Lihat jadwal\n");	//sorting
	printf("\t4. Cek kursi\n");
	printf("\t5. Logout\n");
	printf("\t9. Keluar\n\n");
	printf("\tMasukkan pilihan anda: ");
}

void menu_user(){
	system("cls");
	printf("\t============================================================\n");
	printf("\t|             SELAMAT MENGGUNAKAN LAYANAN KAMI             |\n");
	printf("\t|                                                          |\n");
	printf("\t|                                          onlineticket.com|\n");
	printf("\t============================================================\n\n");
	printf("\t1. Cari jadwal film\n");
	printf("\t2. Cek jumlah kursi yang tersedia\n");
	printf("\t3. Pembelian tiket\n");
	printf("\t4. Logout\n");
}

void login(){
	printf("\t============================================================\n");
	printf("\t=                    Login Sebagai Admin                   =\n");
	printf("\t============================================================\n");
}

/*Fungsi untuk menambahkan jadwal film*/
void Insert(){
	char f[25], confirm;
	int jam, menit;
	Node* temp = (Node*)malloc(sizeof(struct Node));
	judul:
	printf("\t============================================================\n");
	printf("\t|                  -Tambah Jadwal Baru-                    |\n");
	printf("\t============================================================\n");
	printf("\n\tMasukkan judul film: ");
	fflush(stdin);
	gets(f);
	check:
	printf("\n\tMasukkan jam tayang: ");
	scanf("%d.%d", &jam,&menit);
	if(jam > 23 || jam < 0 || menit > 59 || menit < 0){ // syarat untuk memasukkan jam yang sesuai
		fflush(stdin);
		printf("\tJam tidak valid! Masukkan ulang\n");	// jika tidak sesuai, masukkan ulang
		goto check;
	}
	tanya:
	printf("\n\tData sudah benar (y/n)?");
	fflush(stdin);
	scanf("%c",&confirm);
	if(confirm == 'y'){
		strcpy(temp->film,f); // ambil string dari variabel f, masukkan ke node temp->film
		temp->jam = jam;	  // ambil nilai dari variabel jam
		temp->menit = menit;  // ambil nilai dari variabel menit
		temp->next = head;    // Node selanjutnya
		head = temp;
	}
	else if(confirm == 'n'){
		system("cls");
		goto judul;
	}
	else
		goto tanya;
}

//Fungsi untuk menghapus elemen linked list paling depan
void Delete(){
	char tanda[25];
	struct Node *current = head;
	Node* baru = (Node*)malloc(sizeof(struct Node));  //alokasikan memori untuk node baru
	if(current != NULL){
		strcpy(tanda,current->film); // untuk mengambil string dari node yang akan dihapus
		baru=current;				 // nilai node baru = current
		current=current->next;		 // ke node current selanjutnya
		free(baru);					 // hapus node baru
		head=current;				 // nilai node head = current
	}
	printf("\n\tFilm %s dihapus dari jadwal", tanda);
	fflush(stdin);
}

//Fungsi untuk membuat stack kosong
void createEmpty(){
tumpukan.top = 0;
}

void push(int x){
tumpukan.top = tumpukan.top + 1;
tumpukan.data[tumpukan.top] = x;
}

int IsEmpty(){
if (tumpukan.top == 0)
return 1;
else
return 0;
}

int IsFull(){
if (tumpukan.top == max)
return 1;
else
return 0;
}

/*Urutkan jadwal berdasarkan jam tayang*/
struct Node *sort_list(struct Node *head) {

    struct Node *tmpPtr = head;			//inisialisasi node tmpPtr
    struct Node *tmpNxt = head->next;	//inisialisasi node tmpNxt
    int tmp, min;
    char bantu[25];

    /*Urutkan dengan algoritma bubble sort*/
    while(tmpNxt != NULL){
			while(tmpNxt != tmpPtr){	//dikerjakan jika nilai dari tmpNxt tidak sama dengan nilai tmpPtr
					if(tmpNxt->jam < tmpPtr->jam || tmpNxt->jam == tmpPtr->jam && tmpNxt->menit < tmpPtr->menit)
					{
                            tmp = tmpPtr->jam;
                            tmpPtr->jam = tmpNxt->jam;
                            tmpNxt->jam = tmp;
                            min = tmpPtr->menit;
                            tmpPtr->menit = tmpNxt->menit;
                            tmpNxt->menit = min;
                            strcpy(bantu, tmpNxt->film);
                            strcpy(tmpNxt->film, tmpPtr->film);
                            strcpy(tmpPtr->film, bantu);
					}
                    tmpPtr = tmpPtr->next;
			}
            tmpPtr = head;
            tmpNxt = tmpNxt->next;
    }
    return tmpPtr ; // Place holder
}

/*Fungsi untuk menampilkan judul film*/
void Print(){
	struct Node* temp = head;
	system("cls");
	if(head == NULL)
		printf("Film tidak ada");
	else{
		printf("\t---------------------------------------------------------\n");
		printf("\t||    JAM TAYANG                    JUDUL FILM         ||\n");
		printf("\t---------------------------------------------------------\n");
		while(temp != NULL){
				printf("\t\t%.2d.%.2d\t\t\t",temp->jam, temp->menit);
				printf("     %s \n\n",temp->film);
				temp = temp->next;
		}
	}
}

/*Fungsi untuk mencari judul film pada jadwal*/
void search(struct Node *head, char kunci[25])
{
	int i=0;
	struct Node *current = head;
	while (current != NULL){
    	if (strcmp(current->film, kunci) == 0) {  //bandingkan kata kunci dengan daftar film yg tersedia
        	i=1;
        	break;
    	}
    	current = current->next;
	}
	if(i==1){
		printf("\n\tFilm %s ada di jadwal.\n", kunci);
		printf("\tAkan tayang pada jam %.2d.%.2d", current->jam, current->menit);
	}
	else
		printf("\n\tFilm %s tidak ada di jadwal", kunci);
	getch();
}

main(){
	int opsi, save=0, salah=0;
	char yakin;
	top:
	label_menu();
	printf("\n\tMasukkan pilihan: ");
	scanf("%d",&opsi);
	if(opsi==1){
		a:
		int i=0;
		char pass[12], p, savedpass[12]={"admin"};
		system ("cls");
		login();
		printf("\n\tMasukkan Password admin: ");
		while (i<20)
		{
   			pass[i]=getch();
   			p=pass[i];
   			if(p==13)
   				break;
			else
				printf("*");
   			i++;
   		}
		pass[i]='\0';
		if(strcmp(savedpass,pass)==0)
		{
			goto admin;
		}
		else
		{
			salah++;
			printf("\n\tPassword salah\n");
			if(salah%3 == 0){
				goto top;
			}
			goto a;
		}
		// MENU ADMIN //
		admin:
		menu_admin();
      	char pilih_admin, lagi;
		scanf("%d",&pilih_admin);

		switch(pilih_admin){
			case 1:
				ins:
				system("cls");
				Insert();
				m1:
				fflush(stdin);
				printf("\n\tMasukkan lagi(y/n)? ");
				scanf("%c", &lagi);
				if(lagi == 'y' || lagi == 'Y')
					goto ins;
				else if(lagi == 'n' || lagi == 'N')
					goto admin;
				else
					goto m1;
			case 2:
				if(head != NULL){
					head = sort_list(head);
					Delete();
					getch();
					goto admin;
				}
				else
				{
					printf("\n\tJadwal film kosong, tidak ada yang dihapus");
					getch();
					goto admin;
				}
			case 3:
    			if(head != NULL){
    				head = sort_list(head); // Jadwal diurutkan terlebih dahulu
					Print();				// Kemudian dicetak
					getch();
				goto admin;
				}
				else
					printf("\n\tJadwal film masih kosong!");
				goto admin;
			case 4:
				if (IsEmpty() == 1)
				{
					printf ("\n\tKursi belum ada yang terisi");
				}
				else if ((IsEmpty() == 0) && (IsFull() == 0)){
					printf ("\n\tKursi sudah terisi %d(belum penuh)\n\tTersisa %d kursi\n", tumpukan.top, max-save);
				}
				else
					printf ("\n\tKursi sudah penuh");
				getch();
				goto admin;
			case 5:
				goto top; //kembali ke menu utama
			case 9:
				exit(0);  //keluar dari program
			default:
				fflush(stdin);
				printf("\tInput tidak valid!");
				goto admin;
		}
	}
	// MENU USER
	else if(opsi==2){
		int tiket, x, save=0, pilih_user;
		user:
		char kunci[25];
		menu_user();
		printf("\n\tPilih: ");
		scanf("%d",&pilih_user);
		switch(pilih_user){
			case 1:
				printf("\n\tMasukkan nama film: ");
				fflush(stdin);
				gets(kunci);
				search(head, kunci);
				goto user;
			case 2:
				if (IsEmpty() == 1)
				{
					printf("\n\tKursi belum ada yang terisi\n\tTersisa %d kursi", max-save);
				}
				else if ((IsEmpty() == 0) && (IsFull() == 0)){
					printf("\n\tKursi sudah terisi %d(belum penuh)\n\tTersisa %d kursi", tumpukan.top, max-save);
				}
				else
					printf("\n\tKursi sudah penuh");
				getch();
				goto user;
			case 3:
				char trans;
				point:
				system("cls");
				printf("\t============================================================\n");
				printf("\t|             MENU PEMBELIAN TIKET BIOSKOP                 |\n");
				printf("\t|                                                          |\n");
				printf("\t|                                          onlineticket.com|\n");
				printf("\t============================================================\n");
				if(tumpukan.top < max){
					printf("\n\tMasukkan jumlah tiket yang akan dibeli (max %d): ", max-save);
					scanf("%d",&tiket);
					if(tiket > max-save){
						printf("\tJumlah tiket melebihi kursi yang tersedia!");
						goto point;
					}
					c:
					printf("\n\tKonfirmasi transaksi %d tiket?(y/n) ", tiket);
					fflush(stdin);
					scanf("%c",&trans);
					if(trans == 'y' || trans == 'Y'){
						for(x=1; x<=tiket; x++)
							push(tiket);
						save= save+tiket;
						printf("\n\tTerima kasih telah membeli tiket");
						getch();
					}
					else if(trans == 'n' || trans == 'N'){
						printf("\n\tTransaksi dibatalkan");
						getch();
						goto user;
					}
					else
						goto c;
				}
				else
					printf("Stok tiket sudah habis, tidak dapat melakukan transaksi!\n");
				system("cls");
				goto user;
			case 4:
				goto top;
			default:
				printf("\n\tInput salah!");
				goto user;
		}
	}
	else if(opsi==3){
   		x:
		printf("\n\tYakin(y/n)?");
      	fflush(stdin);
		scanf("%c",&yakin);
		if(yakin == 'y' || yakin == 'Y'){
			exit(0);
      	}
		else if(yakin == 'n' || yakin == 'N'){
			goto top;
      	}
      	else
      		goto x;
	}
	else{
		printf("\n\tInput salah!");
		goto top;
	}
	return 0;
}
