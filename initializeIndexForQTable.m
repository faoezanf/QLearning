function [indeksQTable,data] = initializeIndexForQTable(dataset)

    % Fungsi ini bertujuan untuk menginisialisasi array 'indeksQTable' yang
    % berfungsi sebagai indexing / petunjuk indeks dari setiap blok. Isi
    % dari array ini adalah 1 sampai 225. Selain itu, fungsi ini bertujuan
    % untuk membuat array 'data' yang merupakan array yang berbentuk linear
    % dari dataset. Array tersebut akan digunakan untuk mencari reward.

    q=1; % Inisialisasi indeks
    for r = 1:15
        for s = 1:15
            indeksQTable(r,s) = q;
            data(q) = dataset(r,s);
            q = q+1;
        end
    end
end