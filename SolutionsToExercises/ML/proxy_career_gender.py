del clf

y_gender = df['gender'].map({'F':0,'M':1})

num_cols = ["career_break_months"]

preprocess = ColumnTransformer([
    ("num", StandardScaler(), num_cols)
])

# `class_weight="balanced"` helps if positives are rarer
clf = Pipeline([
    ("prep", preprocess),
    ("logreg", LogisticRegression(max_iter=2000, class_weight="balanced", random_state=42))
])

display(clf)

Xtr,Xte,ytr,yte = train_test_split(X, y_gender, stratify=y_gender, random_state=42)
clf.fit(Xtr,ytr)
auc = roc_auc_score(yte, clf.predict_proba(Xte)[:,1])
pr_auc  = average_precision_score(yte, clf.predict_proba(Xte)[:,1])
print("Can we infer gender from X?")
print(f"ROC-AUC={auc:.2f}")  
print(f" PR-AUC={pr_auc:.2f}")  
