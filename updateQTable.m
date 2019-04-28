function QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r)

    % Fungsi ini bertujuan untuk mengupdate nilai yang ada di QTable
    % berdasarkan pergerakan objek / agen.

    % Rumus Update QTable
    jum = r + (epsilon * max(QTableSelanjutnya)) - QTable(arah,indeks);
    QTable(arah,indeks) = QTable(arah,indeks) + (learningRate*jum);
end