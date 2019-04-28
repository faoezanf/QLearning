function QTable = initializeQTable()

    % Fungsi ini bertujuan untuk menginisialisasi QTable dan mengeset nilai
    % arah yang tidak bisa dilalui dengan nilai -Inf (negatif tidak
    % terhingga) dan mengeset nilai 0 untuk setiap blok yang dapat dilalui
    
    QTable = zeros(4,225); % Membuat array dengan ukuran 4 x 225 dengan isi setiap array = 0
    
    for i=1:15 % Perulangan untuk jalur yang berada di sudut atas dan sudut bawah
        QTable(1,i) = -Inf;
        QTable(2,i+210) = -Inf;
    end
    j = 1; % Indeks untuk kolom
    for i=1:15 % Perulangan untuk jalur yang berada di sudut kiri dan sudut kanan
        QTable(3,j) = -Inf;
        QTable(4,j+14) = -Inf;
        j = j + 15;
    end
end